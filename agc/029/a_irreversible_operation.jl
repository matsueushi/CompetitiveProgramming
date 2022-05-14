function solve(s)
    b = 0
    res = 0
    n = length(s)
    for i in 1:n
        if s[i] == 'B'
            b += 1
        else
            res += b
        end
    end
    res
end

function main()
    s = readline()
    println(solve(s))
end

main()
