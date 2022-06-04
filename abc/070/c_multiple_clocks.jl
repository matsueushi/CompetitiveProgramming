parseint() = parse(Int, readline())

function main()
    n = parseint()
    ts = zeros(Int, n)
    for i in 1:n
        ts[i] = parseint()
    end
    println(lcm(ts))
end

main()
