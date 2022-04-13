function main()
    a, b, c, x = parse.(Int64, split(readline()))
    if x ≤ a
        println(1.0)
    elseif x ≤ b
        println(c / (b - a))
    else
        println(0.0)
    end
end

main()
