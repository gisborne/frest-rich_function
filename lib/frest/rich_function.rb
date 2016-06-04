require "frest/rich_function/version"

module Frest
  module RichFunction
    def enrich fn:
      ->(**args){
        begin
          fn.call(**args)
        rescue ArgumentError
          ->(**args2){fn.call(**(args.merge(args2)))}
        end
      }
    end

    module_function :enrich
  end
end
