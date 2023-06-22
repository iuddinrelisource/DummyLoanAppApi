module DealerConstants
    MILAGE = ['60-70', '70-80', '80-90'].freeze
    YEAR = (2000..Time.current.year).to_a.reverse.freeze
    STATUS = ['pending', 'awaiting', 'approved', 'rejected']
end