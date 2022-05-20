function main()
    n, x = parse.(Int, split(readline()))
    xs = parse.(Int, split(readline()))
    println(gcd(xs .- x))
end

main()
