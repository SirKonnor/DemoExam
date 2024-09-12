<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "comments".
 *
 * @property int $id_commen
 * @property string $message
 * @property int $master_id
 * @property int $request_id
 */
class Comments extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'comments';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['message', 'master_id', 'request_id'], 'required'],
            [['master_id', 'request_id'], 'integer'],
            [['message'], 'string', 'max' => 255],
            [['request_id'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_commen' => 'Id Commen',
            'message' => 'Message',
            'master_id' => 'Master ID',
            'request_id' => 'Request ID',
        ];
    }
}
