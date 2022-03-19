const MAXE = 60
const P = 10^9 + 7

function solve(n, q, xs, ys, zs, ws)
    res = 1
    for i in 1:MAXE
        res_i = 0
        for j in 0:1<<n-1
            valid = 1
            for k in 1:q
                if (j >> (xs[k] - 1) | j >> (ys[k] - 1) | j >> (zs[k] - 1)) & 1 != ws[k] >> (i - 1) & 1
                    valid = 0
                    break
                end
            end
            res_i += valid
        end
        res *= res_i
        res %= P
    end
    res
end

function main()
    n, q = parse.(Int64, split(readline()))
    xs = zeros(Int64, q)
    ys = zero(xs)
    zs = zero(xs)
    ws = zero(xs)
    for i in 1:q
        xs[i], ys[i], zs[i], ws[i] = parse.(Int64, split(readline()))
    end
    println(solve(n, q, xs, ys, zs, ws))
end

main()
