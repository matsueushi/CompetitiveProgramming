"""
    reversed_number(n::Int)
Return reversed number (11234 -> 43221)
"""

function reversed_number(n::Int)
    rev = 0
    while n > 0
        rev *= 10
        n, r = divrem(n, 10)
        rev += r
    end
    rev
end
