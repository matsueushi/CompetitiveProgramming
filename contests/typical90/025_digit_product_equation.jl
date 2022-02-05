function dpcount(x, nd, fx, nex, c, n, b)
    nd > 11 && return c
    y = fx + b
    if ndigits(x) == ndigits(y) && y ≤ n
        yn = join(sort(collect(string(y))))
        string(x) == yn && (c += 1)
    end
    for i in nex:9
        c = dpcount(10 * x + i, nd + 1, fx * i, i, c, n, b)
    end
    c
end

function dpe(n, b)
    c = 0
    if n ≥ b && '0' in string(b)
        c += 1
    end
    c = dpcount(0, 0, 1, 1, c, n, b)
    c
end

function main()
    n, b = parse.(Int64, split(readline()))
    println(dpe(n, b))
end

main()
