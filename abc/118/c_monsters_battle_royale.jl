parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function main()
    n = parseint()
    as = parseints()
    println(gcd(as))
end

main()
