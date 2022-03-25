function warshall_floyd(n, p, a, x)
    d = copy(a)
    for i in 1:n
        for j in i:n
            if d[i, j] == -1
                d[i, j] = d[j, i] = x
            end
        end
    end
    for k in 1:n
        for i in 1:n
            for j in 1:n
                d[i, j] = min(d[i, j], d[i, k] + d[k, j])
            end
        end
    end
    less_p = 0
    for i in 1:n
        for j in i+1:n
            d[i, j] ≤ p && (less_p += 1)
        end
    end
    less_p
end

function solve(n, p, k, a)
    wf1 = warshall_floyd(n, p, a, 1)
    wfp = warshall_floyd(n, p, a, p + 1)
    if wfp > k
        println(0)
    elseif wfp == k
        println("Infinity")
    elseif wf1 < k
        println(0)
    else
        l = 1
        r = p + 1
        while r - l > 1
            m = (r + l) ÷ 2
            if warshall_floyd(n, p, a, m) ≤ k
                r = m
            else
                l = m
            end
        end
        x = l == 1 && wf1 == k ? 0 : l
        l = 1
        r = p + 1
        while r - l > 1
            m = (r + l) ÷ 2
            if warshall_floyd(n, p, a, m) < k
                r = m
            else
                l = m
            end
        end
        println(l - x)
    end
end

function main()
    n, p, k = parse.(Int64, split(readline()))
    a = zeros(Int64, n, n)
    for i in 1:n
        a[i, :] = parse.(Int64, split(readline()))
    end
    solve(n, p, k, a)
end

main()
