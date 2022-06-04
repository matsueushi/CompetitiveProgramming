parseint() = parse(Int, readline())

function main()
    n = parseint()
    for i in 0:n-1
        xs = [binomial(i, k) for k in 0:i]
        println(join(xs, " "))
    end
end

main()
