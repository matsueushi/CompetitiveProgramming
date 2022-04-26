function con(csum, n, k, l)
    for j in 1:n-l+1
        if csum[j+l] - csum[j] ≥ l - k
            return true
        end
    end
    false
end

function solve(s, k)
    n = length(s)
    vs = [c == 'X' for c in s]
    csum = cumsum(vs)
    pushfirst!(csum, 0)
    con(csum, n, k, n) && return n
    l = 0
    r = n
    while r - l > 1
        if con(csum, n, k, (l + r) ÷ 2)
            l = (l + r) ÷ 2
        else
            r = (l + r) ÷ 2
        end
    end
    l
end

function main()
    s = readline()
    k = parse(Int, readline())
    println(solve(s, k))
end

main()
