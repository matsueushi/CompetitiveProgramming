const P = 998244353

function solve(n, ps, qs)
    idx = sortperm(ps)
    ps = ps[idx]
    qs = qs[idx]
    flag = falses(n)
    cycles = Vector{Int}[]
    for i in 1:n
        flag[i] && continue
        j = i
        c = Int[]
        while true
            flag[j] && break
            flag[j] = true
            push!(c, j)
            j = qs[j]
        end
        push!(cycles, c)
    end

    # nCk
    fac = zeros(Int, n + 2)
    fac_inv = zero(fac)
    pinv = zero(fac)
    fac[1] = fac[2] = 1
    pinv[1] = pinv[2] = 1
    fac_inv[1] = fac_inv[2] = 1
    for i in 2:n
        fac[i+1] = fac[i] * i % P
        pinv[i+1] = P - fld(P, i) * pinv[P%i+1] % P
        fac_inv[i+1] = fac_inv[i] * pinv[i+1] % P
    end

    count = 1
    for c in cycles
        a = 0
        nc = length(c)
        for k in 0:nc÷2
            a += fac[nc-k+1] * (fac_inv[k+1] * fac_inv[nc-2*k+1] % P) % P
            a %= P
        end
        for k in 0:nc÷2-1
            a += fac[nc-2-k+1] * (fac_inv[k+1] * fac_inv[nc-2-2*k+1] % P) % P
            a %= P
        end
        count = count * a % P
    end

    count
end

function main()
    n = parse(Int, readline())
    ps = parse.(Int, split(readline()))
    qs = parse.(Int, split(readline()))
    println(solve(n, ps, qs))
end

main()
