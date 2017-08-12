context('test the stats_picker class')

test_that(
  'Test the instantiation of the stats_picker class',
  {

    foo <- stats_picker(mtcars)

    expect_true(nrow(foo$levels_lookup) > 0)

    }
  )
