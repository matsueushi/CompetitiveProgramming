function generate!(zs, xs, n, k, p, i, c, s)
    (i > n || c > k || s > p) && return
    i == n && (push!(zs[c+1], s); return)
    generate!(zs, xs, n, k, p, i + 1, c, s)
    generate!(zs, xs, n, k, p, i + 1, c + 1, s + xs[i+1])
end
 
function combi(xs, k, p)
    zs = [Int64[] for _ in 1:k+1]
    generate!(zs, xs, length(xs), k, p, 0, 0, 0)
    sort!.(zs)
end
 
function solve(n, k, p, as)
    m = n ÷ 2
    cb1 = combi(as[1:m], k, p)
    cb2 = combi(as[m+1:end], k, p)
    c = 0
    for i in 0:k
        j = k - i
        for z in cb1[1+i]
            c += searchsortedlast(cb2[1+j], p - z)
        end
    end
    c
end
 
function main()
    n, k, p = parse.(Int64, split(readline()))
    as = parse.(Int64, split(readline()))
    println(solve(n, k, p, as))
end
 
main()
