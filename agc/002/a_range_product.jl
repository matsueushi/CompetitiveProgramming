function main()
    a, b = parse.(Int, split(readline()))
    if a > 0
        println("Positive")
    elseif b < 0
        println(iseven(b - a + 1) ? "Positive" : "Negative")
    else
        println("Zero")
    end
end

main()
