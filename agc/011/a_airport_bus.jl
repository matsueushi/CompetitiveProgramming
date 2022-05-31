parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, c, k, ts)
    sort!(ts)
    bus = 0
    seats = 0
    t = 0
    for i in 1:n
        if seats == 0 || t < ts[i]
            bus += 1
            seats = c
            t = ts[i] + k
        end
        seats -= 1
    end
    bus
end

function main()
    n, c, k = parseints()
    ts = zeros(Int, n)
    for i in 1:n
        ts[i] = parseint()
    end
    println(solve(n, c, k, ts))
end

main()
