function main()
    n, a, b = parse.(Int, split(readline()))
    for i in 1:n
        for u in 1:a
            for j in 1:n
                for v in 1:b
                    print(iseven(i + j) ? '.' : '#')
                end
            end
            println()
        end
    end
end

main()
