module Jekyll
    module CustomFilters
      def array_contains(arr1, arr2)
        arr1 = [arr1].compact unless arr1.is_a?(Array)
        arr2 = [arr2].compact unless arr2.is_a?(Array)
        arr1.any? { |item| arr2.include?(item) }
      end
    end
  end
  
  Liquid::Template.register_filter(Jekyll::CustomFilters)
  