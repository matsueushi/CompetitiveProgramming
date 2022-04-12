const M = 10^5

function calc(x)
    y = x
    while x > 0
        x, r = divrem(x, 10)
        y += r
    end
    y % M
end

function solve(n, k)
    ord = fill(-1, M + 2)
    ord[1+n] = 0
    cycle = fill(-1, M + 2)
    cycle[1] = n
    a, b = 0, 1
    for i in 1:M+1
        n = calc(n)
        if ord[1+n] ≥ 0
            a = ord[1+n]
            b = i - ord[1+n]
            break
        end
        ord[1+n] = i
        cycle[1+i] = n
    end
    cycle[1+a+(k-a)%b]
end

function main()
    n, k = parse.(Int64, split(readline()))
    println(solve(n, k))
end

main()
