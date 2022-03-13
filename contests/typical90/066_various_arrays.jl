function solve(n, xs, ys)
    res = 0.0
    for i in 1:n
        li, ri = xs[i], ys[i]
        di = ri - li + 1
        for j in i+1:n
            lj, rj = xs[j], ys[j]
            dj = rj - lj + 1
            rev = 0
            if ri > rj
                al = max(li, rj + 1)
                rev += (ri - al + 1) * dj
            end
            bl = max(li, lj)
            br = min(ri, rj)
            if bl ≤ br
                m = br - bl + 1
                rev += m * (m - 1) ÷ 2
                if lj < li
                    rev += m * (li - lj)
                end
            end
            res += rev / (di * dj)
        end
    end
    res
end

function main()
    n = parse(Int64, readline())
    xs = zeros(Int64, n)
    ys = zero(xs)
    for i in 1:n
        xs[i], ys[i] = parse.(Int64, split(readline()))
    end
    println(solve(n, xs, ys))
end

main()
