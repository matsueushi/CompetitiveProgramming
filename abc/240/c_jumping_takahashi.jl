const N = 10000

function solve(n, x, as, bs)
    flag = falses(N + 1)
    prev = falses(N + 1)
    flag[1] = true
    for i in 1:n
        flag, prev = prev, flag
        fill!(flag, false)
        for k in 1:N
            prev[k] || continue
            k + as[i] ≤ N + 1 && (flag[k+as[i]] = true)
            k + bs[i] ≤ N + 1 && (flag[k+bs[i]] = true)
        end
    end
    flag[x+1]
end

function main()
    n, x = parse.(Int, split(readline()))
    as = zeros(Int, n)
    bs = zero(as)
    for i in 1:n
        as[i], bs[i] = parse.(Int, split(readline()))
    end
    println(solve(n, x, as, bs) ? "Yes" : "No")
end

main()
