function main()
    s = readline()
    res = 0
    stack = Char[]
    for x in s
        if isempty(stack) || last(stack) == x
            push!(stack, x)
        else
            pop!(stack)
            res += 2
        end
    end
    println(res)
end

main()
