parseint() = parse(Int, readline())

function solve(n, s)
    bs = 0
    for c in s
        c == '#' && (bs += 1)
    end
    res = n - bs
    cres = res
    for c in s
        if c == '.'
            cres -= 1
        else
            cres += 1
        end
        res = min(res, cres)
    end
    res
end

function main()
    n = parseint()
    s = readline()
    println(solve(n, s))
end

main()
