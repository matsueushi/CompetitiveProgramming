const P = 998244353

function solve(n, l, ss)
    res = 0
    for i in 0:2^n-1
        chars = Set{Char}()
        init = false
        for j in 0:n-1
            iszero(i & 1 << j) && continue
            if !init
                chars = Set(collect(ss[j+1]))
                init = true
            else
                chars = intersect(chars, collect(ss[j+1]))
            end
        end
        ai = powermod(length(chars), l, P)
        res += (-1)^(count_ones(i) + 1) * ai
        res = mod(res, P)
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
