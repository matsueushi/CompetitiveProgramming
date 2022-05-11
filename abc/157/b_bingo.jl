function main()
    a = zeros(Int, 3, 3)
    for i in 1:3
        a[i, :] = parse.(Int, split(readline()))
    end
    n = parse(Int, readline())
    bs = Set{Int}()
    for i in 1:n
        push!(bs, parse(Int, readline()))
    end


    used = falses(3, 3)
    for i in 1:3
        for j in 1:3
            a[i, j] ∈ bs && (used[i, j] = true)
        end
    end

    for i in 1:3
        bingo = true
        for j in 1:3
            bingo &= used[i, j]
        end
        bingo && (println("Yes"); return)
    end

    for j in 1:3
        bingo = true
        for i in 1:3
            bingo &= used[i, j]
        end
        bingo && (println("Yes"); return)
    end

    (used[1, 1] && used[2, 2] && used[3, 3]) && (println("Yes"); return)
    (used[1, 3] && used[2, 2] && used[3, 1]) && (println("Yes"); return)

    println("No")
end

main()
