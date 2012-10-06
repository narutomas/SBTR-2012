# encoding: utf-8

module TestHelper
  module Assertions
    def assert_not_errors_on(record, attribute)
      assert record.errors[attribute].blank?, "Expected #{record} to not have errors on #{attribute}"
    end

    def assert_errors_on(record, attribute)
      assert !record.errors[attribute].blank?, "Expected #{record} to have errors on #{attribute}"
    end

    def assert_not_valid(record)
      assert !record.valid?, "Expected #{record} to be invalid"
    end

    def assert_valid(record)
      assert record.valid?, "Expected #{record} to be valid"
    end

    def assert_not_validates_with(record, attribute, value)
      record.send("#{attribute}=", value)
      record.valid?
      assert_errors_on(record, attribute)
    end

    def assert_validates_with(record, attribute, value)
      record.send("#{attribute}=", value)
      record.valid?
      assert_not_errors_on(record, attribute)
    end

    def assert_changes(*changes, &block)
      block_binding = block.send(:binding)
      before = changes.in_groups_of(2).map do |expression, change|
        eval(expression, block_binding)
      end

      block_result = block.call

      changes.in_groups_of(2).each_with_index do |(expression, change), index|
        change = 1 if change.nil?
        error = "#{expression.inspect} didn't change by #{change}"
        assert_equal(before[index] + change, eval(expression, block_binding), error)
      end

      block_result
    end

    def assert_greater_than(one, other)
      assert(one > other, "Expected #{one} to be greater than #{other}")
    end

    def assert_less_than(one, other)
      assert(one < other, "Expected #{one} to be less than #{other}")
    end

    def assert_not_blank(thing)
      assert(!thing.blank?, "Expected `#{thing}` to be not be blank")
    end

    # --- Authentication

    def assert_authenticated
      assert !assigns(:authenticated).nil?, "Expected to be authenticated"
    end

    def assert_not_authenticated
      assert assigns(:authenticated).nil?, "Expected to not be authenticated"
    end

    # --- Rendering

    def assert_body_includes(text)
      assert response.body.include?(text), "Expected the body to include: #{text}"
    end
  end
end
