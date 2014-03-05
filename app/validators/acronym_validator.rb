class AcronymValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    if value.split.count != 3
      record.errors[attribute] << options[:message] || 'must be 3 words'
    end
  end

end
