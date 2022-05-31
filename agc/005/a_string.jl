function solve(x)
    stack = Char[]
    for c in x
        if !isempty(stack) && last(stack) == 'S' && c == 'T'
            pop!(stack)
        else
            push!(stack, c)
        end
    end
    length(stack)
end

function main()
    x = readline()
    println(solve(x))
end

main()
