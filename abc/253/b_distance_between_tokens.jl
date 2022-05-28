parseints() = parse.(Int, split(readline()))

function main()
    h, w = parseints()
    ss = Vector{String}(undef, h)
    for i in 1:h
        ss[i] = readline()
    end
    x, y = 0, 0
    for i in 1:h
        for j in 1:w
            ss[i][j] == '-' && continue
            if x == 0 && y == 0
                x, y = i, j
            else
                println(abs(x - i) + abs(y - j))
                return
            end
        end
    end
end

main()
