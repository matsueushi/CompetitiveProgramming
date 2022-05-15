count(n, x) = n < 0 ? 0 : n ÷ x + 1

function main()
    a, b, x = parse.(Int, split(readline()))
    println(count(b, x) - count(a - 1, x))
end

main()
