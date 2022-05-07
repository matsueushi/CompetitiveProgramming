function area(mat, n)
    xs = Int[]
    ys = Int[]
    for i in 1:n
        for j in 1:n
            if mat[i, j] == 1
                push!(xs, i)
                push!(ys, j)
            end
        end
    end
    sort!(xs)
    sort!(ys)
    unique!(xs)
    unique!(ys)
    (first(xs), last(xs)), (first(ys), last(ys))
end

function check(mat1, mat2, n)
    (s1, t1), (u1, v1) = area(mat1, n)
    (s2, t2), (u2, v2) = area(mat2, n)
    ((t1 - s1) == (t2 - s2) && (v1 - u1) == (v2 - u2)) || return false
    for i in s1:t1
        for j in u1:v1
            i2 = i + s2 - s1
            j2 = j + u2 - u1
            mat1[i, j] != mat2[i2, j2] && return false
        end
    end
    true
end

function solve(n, ss, ts)
    mss = zeros(Int, (n, n))
    mts = zeros(Int, (n, n))
    for i in 1:n
        for j in 1:n
            ss[i][j] == '#' && (mss[i, j] = 1)
            ts[i][j] == '#' && (mts[i, j] = 1)
        end
    end
    ret = false
    for i in 0:3
        ret |= check(rotr90(mss, i), mts, n)
    end
    ret
end

function main()
    n = parse(Int, readline())
    ss = Vector{String}(undef, n)
    ts = Vector{String}(undef, n)
    for i in 1:n
        ss[i] = readline()
    end
    for i in 1:n
        ts[i] = readline()
    end
    println(solve(n, ss, ts) ? "Yes" : "No")
end

main()
