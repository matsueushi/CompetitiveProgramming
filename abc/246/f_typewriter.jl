const P = 998244353

function solve(n, l, ss)
    ss0 = Int[]
    for s in ss
        a = 0
        for x in collect(s) .- 'a'
            a |= 1 << x
        end
        push!(ss0, a)
    end
    res = 0
    for i in 0:2^n-1
        chars = -1
        for j in 0:n-1
            iszero(i & 1 << j) && continue
            if chars < 0
                chars = ss0[j+1]
            else
                chars &= ss0[j+1]
            end
        end
        if chars > 0
            ai = powermod(count_ones(chars), l, P)
            res += (-1)^(count_ones(i) + 1) * ai
            res = mod(res, P)
        end
    end
    res
end

function main()
    n, l = parse.(Int, split(readline()))
    ss = String[]
    for i in 1:n
        push!(ss, readline())
    end
    println(solve(n, l, ss))
end

main()
