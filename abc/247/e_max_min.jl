function sub(l, r)
    t = r - l + 1
    t * (t + 1) ÷ 2
end

function count(n, flags)
    ret = 0
    lv = 0
    isv = false
    for i in 1:n
        if flags[i]
            if !isv
                lv = i
            end
            if i == n
                ret += sub(lv, n)
            end
            isv = true
        else
            if isv
                ret += sub(lv, i - 1)
            end
            isv = false
        end
    end
    ret
end

function solve(n, x, y, as)
    ret = 0
    valid = (as .≤ x) .& (as .≥ y)
    ret = count(n, valid)
    down = valid .& (as .< x)
    ret -= count(n, down)
    up = valid .& (as .> y)
    ret -= count(n, up)
    mid = valid .& (as .< x) .& (as .> y)
    ret += count(n, mid)
    ret
end

function main()
    n, x, y = parse.(Int64, split(readline()))
    as = parse.(Int64, split(readline()))
    println(solve(n, x, y, as))
end

main()
