function solve(s)
    n = length(s)
    res = typemax(Int)
    for c in 'a':'z'
        l = 0
        ops = 0
        for i in 1:n
            if c == s[i]
                l = 0
            else
                l += 1
                ops = max(ops, l)
            end
        end
        res = min(res, ops)
    end
    res
end

function main()
    s = readline()
    println(solve(s))
end

main()
