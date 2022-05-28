parseints() = parse.(Int, split(readline()))

function main()
    a, b, c = parseints()
    println(ifelse(b == sort([a, b, c])[2], "Yes", "No"))
end

main()
