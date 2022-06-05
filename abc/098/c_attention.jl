parseint() = parse(Int, readline())

function solve(n, s)
    es_r = 0
    ws_l = 0
    for i in 1:n
        if s[i] == 'E'
            es_r += 1
        end
    end
    res = typemax(Int)
    for i in 1:n
        if s[i] == 'E'
            es_r -= 1
            res = min(res, es_r + ws_l)
        else
            res = min(res, es_r + ws_l)
            es_r += 1
        end
    end
    res
end

function main()
    n = parseint()
    s = readline()
    println(solve(n, s))
end

main()
