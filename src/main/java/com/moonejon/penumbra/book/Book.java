package com.moonejon.penumbra.book;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;

@Entity
public class Book {

    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE)
    private Integer id;

    @Column(name="owner_id", nullable=false, unique=false)
    private Integer owner_id;


//    protected Book() {};

    public Book( )
}
