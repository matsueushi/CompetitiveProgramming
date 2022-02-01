function cross_sum(mat)
    h, w = size(mat)
    vsum = sum(mat, dims = 1)
    hsum = sum(mat, dims = 2)
    for i in 1:h
        for j in 1:w
            j != 1 && print(" ")
            print(vsum[j] + hsum[i] - mat[i, j])
        end
        println()
    end
end

function main()
    h, w = parse.(Int64, split(readline()))
    mat = Matrix{Int64}(undef, h, w)
    lines = readlines()
    for (i, l) in enumerate(lines)
        mat[i, :] = parse.(Int64, split(l))
    end
    cross_sum(mat)
end

main()
