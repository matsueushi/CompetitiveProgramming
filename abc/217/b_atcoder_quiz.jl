function main()
    s = Set{String}()
    for i in 1:3
        push!(s, readline())
    end
    for con in ["ABC", "ARC", "AGC", "AHC"]
        con ∉ s && (println(con); break)
    end
end

main()
