function solve(h, w, ss)
    for i in 1:h
        for j in 1:w
            ss[i][j] == '#' && (print('#'); continue)
            count = 0
            for k in -1:1
                for l in -1:1
                    (1 ≤ i + k ≤ h && 1 ≤ j + l ≤ w && !(k == l == 0)) || continue
                    ss[i+k][j+l] == '#' && (count += 1)
                end
            end
            print(count)
        end
        println()
    end

end

function main()
    h, w = parse.(Int, split(readline()))
    ss = Vector{String}(undef, h)
    for i in 1:h
        ss[i] = readline()
    end
    solve(h, w, ss)
end

main()
