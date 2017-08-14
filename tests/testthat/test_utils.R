context('Test the utils functions')

# Setup levels to be used in test_df categorical columns

levels1 = letters[1:4]
levels2 = letters[11:15]
levels3 = letters[20:23]

# Use R's recycling of categories to populate test_df categorical columns

test_df <- data.frame(
  cat1 = factor(levels1),
  cat2 = factor(levels2),
  cat3 = factor(levels3),
  cont = rnorm(100)
  )

test_that(
  'level_df works for a single column',
  {

    test_levels <- levels_df(test_df, 'cat1')

    expect_is(test_levels, 'data.frame')
    expect_equal(test_levels$levels, levels1)

    }
  )

test_that(
  'level_df works in a purrr statement',
  {

    # Get list of factor columns

    cats <- names(test_df)[sapply(test_df, is.factor)]

    levels_lookup = purrr::map_df(cats, function(x) levels_df(test_df, x))

    expect_is(levels_lookup, 'data.frame')
    expect_equal(levels_lookup[levels_lookup$column=='cat1','levels'], levels1)
    expect_equal(levels_lookup[levels_lookup$column=='cat2','levels'], levels2)
    expect_equal(levels_lookup[levels_lookup$column=='cat3','levels'], levels3)

    }
  )
