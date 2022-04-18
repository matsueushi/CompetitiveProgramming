function main()
    dx = [1, 2, 2, 1, -1, -2, -2, -1]
    dy = [2, 1, -1, -2, -2, -1, 1, 2]
    x1, y1, x2, y2 = parse.(Int, split(readline()))
    pos = Set{Pair{Int,Int}}()
    for i in 1:8
        push!(pos, x1 + dx[i] => y1 + dy[i])
    end
    for i in 1:8
        if (x2 + dx[i] => y2 + dy[i]) ∈ pos
            println("Yes")
            return
        end
    end
    println("No")
end

main()
