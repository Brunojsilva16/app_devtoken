<?php

namespace App\Models;

use App\Database\DataSource;

class CourseModel
{
    private DataSource $db;
    protected string $table = 'courses';
    protected string $pivotTable = 'user_courses';

    public function __construct()
    {
        $this->db = DataSource::getInstance();
    }
    

    public function findById(int $id): ?array
    {
        $sql = "SELECT * FROM {$this->table} WHERE id = :id";
        return $this->db->selectOne($sql, ['id' => $id]);
    }

    public function findAll(): array
    {
        $sql = "SELECT * FROM {$this->table} ORDER BY title ASC";
        return $this->db->select($sql);
    }

    public function findAllPublished(): array
    {
        $sql = "SELECT * FROM {$this->table} WHERE status = 'published'";
        return $this->db->select($sql);
    }

    public function create(array $data): bool
    {
        $data['price'] = !empty($data['price']) ? $data['price'] : null;
        $sql = "INSERT INTO {$this->table} (title, description, instructor, price, image_url, status, workload, target_audience, format, level, modality, category) VALUES (:title, :description, :instructor, :price, :image_url, :status, :workload, :target_audience, :format, :level, :modality, :category)";
        return $this->db->execute($sql, $data);
    }

    public function update(int $id, array $data): bool
    {
        $data['id'] = $id;
        $data['price'] = !empty($data['price']) ? $data['price'] : null;
        $sql = "UPDATE {$this->table} SET title = :title, description = :description, instructor = :instructor, price = :price, image_url = :image_url, status = :status, workload = :workload, target_audience = :target_audience, format = :format, level = :level, modality = :modality, category = :category WHERE id = :id";
        return $this->db->execute($sql, $data);
    }

    public function delete(int $id): bool
    {
        $sql = "DELETE FROM {$this->table} WHERE id = :id";
        return $this->db->execute($sql, ['id' => $id]);
    }
}