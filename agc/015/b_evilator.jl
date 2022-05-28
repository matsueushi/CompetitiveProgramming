function solve(s)
    n = length(s)
    res = 0
    for i in 1:n
        if s[i] == 'U'
            res += n - i
            res += 2 * (i - 1)
        else
            res += 2 * (n - i)
            res += i - 1
        end
    end
    res
end

function main()
    s = readline()
    println(solve(s))
end

main()
