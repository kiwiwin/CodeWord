class Hash
    def sort_dec
        sort { |lhs, rhs| rhs[1] <=> lhs[1] }
    end
end