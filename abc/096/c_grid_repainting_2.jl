const dx = [1, 0, -1, 0]
const dy = [0, 1, 0, -1]

function solve(h, w, ss)
    for i in 1:h
        for j in 1:w
            ss[i][j] == '#' || continue
            extendable = false
            for k in 1:4
                x = i + dx[k]
                y = j + dy[k]
                if 1 ≤ x ≤ h && 1 ≤ y ≤ w
                    extendable |= ss[x][y] == '#'
                end
            end
            extendable || return false
        end
    end
    true
end

function main()
    h, w = parse.(Int, split(readline()))
    ss = Vector{String}(undef, h)
    for i in 1:h
        ss[i] = readline()
    end
    println(ifelse(solve(h, w, ss), "Yes", "No"))
end

main()
