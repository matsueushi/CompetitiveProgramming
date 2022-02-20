function solve(n, s, xs, ys)
    table = fill("", s)
    xs[1] ≤ s && (table[xs[1]] = "A")
    ys[1] ≤ s && (table[ys[1]] = "B")
    nexttable = fill("", s)
    for (x, y) in zip(xs[2:end], ys[2:end])
        for i in 1:s
            table[i] == "" && continue
            i + x ≤ s && (nexttable[i+x] = table[i] * "A")
            i + y ≤ s && (nexttable[i+y] = table[i] * "B")
        end
        table, nexttable = nexttable, table
        fill!(nexttable, "")
    end
    y = last(table)
    y == "" ? "Impossible" : y
end

function main()
    n, s = parse.(Int64, split(readline()))
    xs = zeros(Int64, n)
    ys = zeros(Int64, n)
    for i in 1:n
        xs[i], ys[i] = parse.(Int64, split(readline()))
    end
    println(solve(n, s, xs, ys))
end

main()
