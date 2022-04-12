const nx = 1000 + 1
const ny = 1000 + 1

function cluttered_area(n, lxs, lys, rxs, rys)
    mark = zeros(Int64, (nx, ny))
    for i in 1:n
        lx = lxs[i] + 1
        ly = lys[i] + 1
        rx = rxs[i] + 1
        ry = rys[i] + 1
        mark[lx, ly] += 1
        mark[rx, ly] -= 1
        mark[lx, ry] -= 1
        mark[rx, ry] += 1
    end

    count = zeros(Int64, n)
    orig = cumsum(mark; dims = 1)
    orig = cumsum(orig; dims = 2)
    for x in orig
        x != 0 && (count[x] += 1)
    end
    count
end

function main()
    n = parse(Int64, readline())
    lxs = zeros(Int64, n)
    lys = zeros(Int64, n)
    rxs = zeros(Int64, n)
    rys = zeros(Int64, n)
    for i in 1:n
        lxs[i], lys[i], rxs[i], rys[i] = parse.(Int64, split(readline()))
    end
    count = cluttered_area(n, lxs, lys, rxs, rys)
    println(join(count, "\n"))
end

main()
