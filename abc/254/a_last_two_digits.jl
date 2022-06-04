using Printf

parseint() = parse(Int, readline())

function main()
    n = parseint()
    @printf "%02i" n % 100
    println()
end

main()
