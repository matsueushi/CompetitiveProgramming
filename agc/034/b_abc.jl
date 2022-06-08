function countsub(x)
    y = 0
    res = 0
    for c in reverse(x)
        if c == 'D'
            y += 1
        else
            res += y
        end
    end
    res
end

function solve(s)
    t = replace(s, "BC" => "D")
    n = length(t)
    p = 1
    res = 0
    while true
        while p ≤ n
            t[p] == 'A' && break
            p += 1
        end
        p == n + 1 && break
        q = p
        while q ≤ n
            (t[q] == 'A' || t[q] == 'D') || break
            q += 1
        end
        res += countsub(t[p:q-1])
        p = q
    end
    res
end

function main()
    s = readline()
    println(solve(s))
end

main()
