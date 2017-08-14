context('Test the statspicker class and pick method')

# Setup levels to be used in test_df categorical columns

levels1 = letters[2:6]
levels2 = letters[11:15]
levels3 = letters[26:22]

# Use R's recycling of categories to populate test_df categorical columns

test_df <- data.frame(
  cat1 = levels1,
  cat2 = levels2,
  cat3 = levels3,
  cont = rnorm(100)
  )

target <- statspicker(test_df)


test_that(
  'statspicker class instantiation works as expected',
  {

    expect_is(target$levels_lookup, 'data.frame')

    expect_equal(
      target$levels_lookup[target$levels_lookup$column=='cat1','levels'],
      levels1
      )

    expect_equal(
      target$levels_lookup[target$levels_lookup$column=='cat2','levels'],
      levels2
      )

    expect_equal(
      target$levels_lookup[target$levels_lookup$column=='cat3','levels'],
      levels3
      )

    }
  )

test_that(
  'pick method works when passed a single level argument.',
  {

    expect_equivalent(
      pick(target, levels1[1]),
      test_df[test_df$cat1 == levels1[1],]
      )

    }
  )

test_that(
  'pick method works when passed a two level arguments.',
  {

    expect_equivalent(
      pick(target, c(levels1[1], levels2[1])),
      test_df[test_df$cat1 == levels1[1] & test_df$cat2 == levels2[1],]
      )

    }
  )

test_that(
  'pick method works when passed two levels from the same column.',
  {

    expect_equivalent(
      pick(target, c(levels1[1], levels1[2])),
      test_df[test_df$cat1 %in% c(levels1[1],levels1[2]),]
      )

    }
  )

test_that(
  'pick method works when passed two levels from the same column, and one from another column.',
  {

    expect_equivalent(
      pick(target, c(levels1[1], levels1[2], levels2[1])),
      test_df[test_df$cat1 %in% c(levels1[1],levels1[2]) & test_df$cat2 %in% c(levels2[1]),]
      )

    }
  )
