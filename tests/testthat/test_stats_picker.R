context('Test the stats_picker class')

# Setup levels to be used in test_df categorical columns

levels1 = letters[1:10]
levels2 = letters[11:15]
levels3 = letters[26:22]

# Use R's recycling of categories to populate test_df categorical columns

test_df <- data.frame(
  cat1 = levels1,
  cat2 = levels2,
  cat3 = levels3,
  cont = rnorm(100)
  )

test_that(
  'stats_picker class instantiation works as expected',
  {

    target <- stats_picker(test_df)
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
