using Statistics

parseints() = parse.(Int, split(readline()))

function main()
    a, b, c = parseints()
    println(ifelse(b == median([a, b, c]), "Yes", "No"))
end

main()
