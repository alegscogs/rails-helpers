module AlegscogsHelpers
  def phrasify(*args)
    options = args.extract_options!
    join = options.delete(:join)
    args.map! do |arg| 
      if arg.is_a?(Array)
        arg.map!{|e| e.is_a?(Array) ? phrasify(*e) : e }
      else 
        arg
      end
    end

    if args.length == 1
      word = args[0]
      if word.is_a?(String)
        return word
      elsif word.is_a?(Array)
        join ? word.join(*join) : word.to_sentence(options)
      end
    elsif args[1].present?
      word, ary = args[0], [*args[1]]
      if word.is_a?(Array)
        word = word[ary.length - 1] || word.last
      end
      ary.delete_if{|e| e.blank?}
      word + ' ' + ary.to_sentence(options)
    end
  end
end
